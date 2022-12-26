import joi from "joi";



async function userValidation(user) {
    const signup = joi.object({
        username: joi.string().min(3).required(),
        email: joi.string().email().required(),
        password: joi.string().min(8).required()
    })

    const login = joi.object({
        email: joi.string().email().required(),
        password: joi.string().min(8).required()
    });
    const whatToReturn = {
        signup: signup.validate(user),
        login: login.validate(user)
    }
    

    return whatToReturn;
}

export default userValidation;