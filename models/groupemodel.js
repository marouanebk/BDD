const  mongoose = require("mongoose");

const groupeSchema = new mongoose.Schema({
   name:{
    type: String,
    required : true,
   },
    members:{
        type : Array,
    },
    admin:{
        type:mongoose.Schema.Types.ObjectId,
        ref : "User",
        required : true,
    }

  
},
    {
            timestamps:true,
    }
);

module.exports = mongoose.model("Groupe", groupeSchema);
