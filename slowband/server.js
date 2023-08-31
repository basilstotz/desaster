const fs = require("fs");

const express = require("express");
const bodyParser = require("body-parser");
const path = require("path");

const app = express();

app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, "public")));

app.get("/", (req, res) => {
 res.sendFile(path.join(__dirname, "public", "index.html"));
});

app.post("/upload", (req, res) => {
 // Get the image from the request body
 const image = req.body.image;

    console.log("postimage");
 // Save the image to the server
 fs.writeFileSync("./image.png", image);

 // Send a success response
 res.send(200, {
  message: "Image uploaded successfully"
 });
});

app.listen(3000, () => {
 console.log("Server is listening on port 3000");
});
