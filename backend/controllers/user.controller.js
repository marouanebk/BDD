const bcrypt = require("bcryptjs");
const userServices = require("../services/user.services");

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
      console.log("login");

      res.status(200).send({
        type: "Success",
        data: results,
      });
    }
  });
};

exports.userProfile = (req, res, next) => {
  return res.status(401).json({ message: "Authorized User!!" });
};

