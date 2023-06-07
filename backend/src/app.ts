import express from "express";
import { authrouter } from "./routes/authentication.routes";
import { createConnection, ConnectionOptions } from "typeorm";
import config from "./ormconfig"
import "reflect-metadata";

const app = express();
const port = process.env.PORT || 8000;

createConnection(config as ConnectionOptions).then( async (connection) => {
    if (connection.isConnected) {
        console.log("🐘 is connected !");
    }
    app.set("port", port);
    app.use(express.json());
    app.use(express.urlencoded({ extended : false}));

    app.use("/user",authrouter);

    app.listen(app.get("port"), () => {
        console.log(`🚀 is rocking over ${app.get("port")}`);
    });
});


// app.get("/", (req, res) => {
//     res.send({
//         data: "theSocial Rebuild API",
//     });
// });

