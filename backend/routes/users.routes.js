const usersController = require("../controllers/user.controller");

const express = require("express");
const router = express.Router();

router.post("/register", usersController.register);
router.post("/login", usersController.login);

router.put("/changetype", usersController.changeType);
router.put("/setBiography", usersController.setBiography);
router.put("/setProfilePicture/:id", usersController.setProfilePicture);



router.get("/getUserDetails/:id", usersController.getUserDetails);
router.get("/getUserDetailsById/:id", usersController.getUserDetailsById);
router.get("/user-Profile", usersController.userProfile);




module.exports = router;