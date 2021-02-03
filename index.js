const express = require('express');
const connection = require("./config");
const app = express();
const port = 5050;
app.use(express.json())

connection.connect(function(err) {
    if (err) {
      console.error('error connecting: ' + err.stack);
      return;
    }
    console.log('connected as id ' + connection.threadId);
  });

app.get("/", (request, response) => {
    console.log(request);
    response.send("Welcome to Express");
  });

app.get("/travaux", (req, res) => {
    connection.query("SELECT * from travaux", (err, results) => {
        if (err) {
          res.status(500).send("Error retrieving data");
        } else {
          res.status(200).json(results);
        }
      });
  });

app.post("/travaux", (req, res) => {
    const { nature, image1, image2, image3, image4 } = req.body;
    connection.query(
        "INSERT INTO travaux(nature, image1, image2, image3, image4) VALUES(?, ?, ?, ?, ?)",
        [nature, image1, image2, image3, image4], 
        (err, results) => {
              if (err) {
                console.log(err);
                res.status(500).send("Error saving travaux");
              } else {
                res.status(200).send("Successfully saved");
              }
            }
        ); 
  });

app.listen(port, () => {
    console.log(`Server is running on ${port}`);
  });






