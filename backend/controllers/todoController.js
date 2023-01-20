const router = require("express").Router()
const Todo = require("../models/Todo");

// routes will be here....
//get user done todo list
router.get("/todos/done/:_userid", async (req, res) => {
    const { _userid } = req.params;
    const allTodo = await Todo.find({ userid: _userid, status: "Done" });
    console.log(allTodo);
    return res.status(200).send({
        todo: allTodo
    })
})
//get user done 
router.get("/todos/undone/:_userid", async (req, res) => {
    const { _userid } = req.params;
    const allTodo = await Todo.find({ userid: _userid, status: "Undone" });
    console.log(allTodo);
    return res.status(200).send({
        todo: allTodo
    })
})

// routes
router
    .post("/add/todo", (req, res) => {
        const { todo, userid } = req.body;
        const newTodo = new Todo({ todo: todo, userid: userid, });

        // save the todo
        newTodo
            .save()
            .then(() => {
                return res.status(200).send({
                    newtodo: newTodo
                })
            })
            .catch((err) => console.log(err));
    })

    .delete("/todos/delete/todo/:_id", (req, res) => {
        const { _id } = req.params;
        Todo.deleteOne({ _id: _id })
            .then(() => {
                return res.status(200).send({
                    message: "Todo deleted successfully"
                })
            })
            .catch((err) => console.log(err));
    })

    .put("/edit/todo/:_id", async (req, res) => {
        const { userid } = req.params;
        const newtodo = req.body.todo;

        const todo = await Todo.findOne({ userid });
        Todo.updateOne({ userid: userid }, { $set: { todo: newtodo } }, function (err, res) {
            if (err) throw err;
        });
        const todo1 = await Todo.findOne({ userid: userid });

        return res.status(200).send({
            editedTodo: todo1
        })

    }).put("/todos/edit/status/:_id", async (req, res) => {
        const { _id } = req.params;
        Todo.updateOne({ _id: _id }, { $set: { status: "Done" } }, function (err, res) {
            if (err) throw err;
        });
        return res.status(200).send({
            message: "success"
        })

    })


module.exports = router;
