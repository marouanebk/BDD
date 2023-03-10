const bcrypt = require("bcryptjs");
const userServices = require("../services/user.services");
const User = require("../models/user.model");


/**
 * 1. To secure the password, we are using the bcryptjs, It stores the hashed password in the database.
 * 2. In the SignIn API, we are checking whether the assigned and retrieved passwords are the same or not using the bcrypt.compare() method.
 * 3. In the SignIn API, we set the JWT token expiration time. Token will be expired within the defined duration.
 */
exports.register = (req, res, next) => {
  console.log("on registration controller ");
  const { password } = req.body;

  const salt = bcrypt.genSaltSync(10);

  req.body.password = bcrypt.hashSync(password, salt);

  userServices.register(req.body, (error, results) => {
    if (error) {
      return res.status(401).send({
        message: error.message,
        data: error,
      });
    }
    else {

      return res.status(200).send({
        message: "Success",
        data: results,
      });
    }

  });
};

exports.login = (req, res, next) => {
  const { email, password } = req.body;


  userServices.login({ email, password }, (error, results) => {
    if (error) {
      return res.status(401).send({
        message: error.message,
        data: error,
      });
    }
    else {
      console.log("login");

      res.status(200).send({
        message: "Success",
        data: results,
      });
    }
  });
};

exports.changeType = (req, res, next) => {
  const { userid, type } = req.body;
  console.log("in cahnge type controller backend");


  userServices.changeType({ userid, type }, (error, results) => {
    if (error) {
      console.log("error")
      res.status(401).send({
        type: "Error",
        data: results,
      });
    }
    else {
      console.log("change type");

      res.status(200).send({
        type: "Success",
        data: results,
      });
    }
  });
};

exports.setBiography = (req, res, next) => {
  const { userid, biography } = req.body;


  userServices.setBiography({ userid, biography }, (error, results) => {
    if (error) {
      console.log("error")
      res.status(401).send({
        type: "Error",
        data: results,
      });
    }
    else {

      res.status(200).send({
        type: "Success",
        data: results,
      });
    }
  });
};

exports.getUserDetails = async (req, res, next) => {
  id = req.params.id
  let user
  try {
    user = await User.findById(id);
  } catch (err) {
    return res.status(500).json({ message: err.message })
  }
  if (!user) {
    return res.status(404).json({ message: 'Cannot find user' })
  }
  return res.status(200).send({ result: user })
}; 
exports.getUserDetailsById = async (req, res, next) => {
  id = req.params.id
  let user
  try {
    user = await User.findOne({userid : id});
  } catch (err) {
    return res.status(500).json({ message: err.message })
  }
  if (!user) {
    return res.status(404).json({ message: 'Cannot find user' })
  }
  return res.status(200).send({ result: user })
};

exports.setProfilePicture = async (req, res, next) => {
  id = req.params.id;
  link = req.body.link;
  console.log(id);
  console.log(link);
  let user
  try {
    User.updateOne({ userid: id }, { $set: { profile_picture: link } }, function (err, res) {
      if (err) throw err;
      console.log("1 document updated");
    });
    return res.status(200).json({ result: "success" })

  } catch (err) {
    console.log(err.message);
    return res.status(500).json({ message: err.message })
  }
  if (!user) {
    return res.status(404).json({ message: 'Cannot find user' })
  }
  return res.status(200).send({ result: "success" })
};




exports.userProfile = (req, res, next) => {
  return res.status(401).json({ message: "Authorized User!!" });
};

