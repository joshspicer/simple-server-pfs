const express = require("express");
const app = express();
const port = process.env.SERVICE_PORT;

app.get("/", (req, res) => {
  console.log(`${new Date()} ${req.method} ${req.path}`);
  res.send("Hello World!");
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
