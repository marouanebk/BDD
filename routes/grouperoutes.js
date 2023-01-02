const {addgroupe, addtogroupe, removefromgroupe} = require("../controllers/groupecontroller");

const router = require("express").Router();

router.post("/addgroupe/", addgroupe),
router.post("/addtogroupe/", addtogroupe),
router.post("/removefromgroupe/", removefromgroupe),

module.exports = router;
