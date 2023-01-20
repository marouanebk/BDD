const User = require("../models/user.model");
const bcrypt = require("bcryptjs");
const auth = require("../middlewares/auth.js");

const otpGenerator = require("otp-generator");
const crypto = require("crypto");
const key = "verysecretkey"; // Key for cryptograpy. Keep it secret
var msg91 = require("msg91")("1", "1", "1");

async function login({ email, password }, callback) {
  const user = await User.findOne({ email });

  if (user != null) {
    if (bcrypt.compareSync(password, user.password)) {
      const token = auth.generateAccessToken(email);
      // call toJSON method applied during model instantiation
      return callback(null, { ...user.toJSON(), token });
    } else {
      return callback({
        message: "Invalid Email/Password!",
      });
    }
  } else {
    return callback({
      message: "Invalid Email/Password!",
    });
  }
}

async function register(params, callback) {
  if (params.email === undefined) {
    console.log(params.email);
    return callback(
      {
        message: "Email Required",
      },
      ""
    );
  }
  console.log("pararms.email", params.email);
  _email = params.email;

  const _user = await User.findOne({ email: _email });
  console.log(_user);
  console.log("after console log and before check ");
  if (_user != null) {
    console.log(params.email);
    console.log("NOT NULL")
    return callback(
      {
        message: "Email ALready in use",
      },
      ""
    );

  }


  const user = new User(params);
  user
    .save()
    .then((response) => {
      return callback(null, response);
    })
    .catch((error) => {
      return callback(error);
    });
}

async function changeType({ userid, type }, callback) {
  const user = await User.findOne({ userid: userid });

  User.updateOne({ userid: userid }, { $set: { type: type } }, function (err, res) {
    if (err) throw err;
    console.log("1 document updated");
  });
  const user1 = await User.findOne({ userid: userid });
  if (type == "Teacher")
    return callback(
      null,
      {
        message: 2,
      },

    );
  else if (type == "Student")
    return callback(
      null,
      {
        message: 1,
      },

    );

}
async function setBiography({ userid, biography }, callback) {
  const user = await User.findOne({ userid: userid });
  

  User.updateOne({ userid: userid }, { $set: { biography: biography } }, function (err, res) {
    if (err) throw err;
    console.log("1 document updated");
  });
  const user1 = await User.findOne({ userid: userid });
  console.log(user1);
  return callback(
    null,
    {
      message: "success",
    },

  );


}



module.exports = {
  login,
  register,
  changeType,
  setBiography,

};
