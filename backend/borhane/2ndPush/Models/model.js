import { Schema, plugin, model } from 'mongoose';
import muv from 'mongoose-unique-validator';


const userSchema = Schema(
    {
        username: {
            type: String,
            required: true,
        },
        password: {
             type: String,
             required: true,
        },
        email: {
             type: String,
             required: true,
             unique: true,
         }
        });

plugin(muv)

export default model('users', userSchema);        




