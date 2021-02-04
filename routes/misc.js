const express = require("express");
const passport = require("passport");
const router = express.Router();
const { db } = require("../config");

router.get("/", (req, res) => {
    const msg =
      "Welcome on Authentication-101! Feel free to read the README.md file";
    res.status(200).send(msg);
  });

router.get("/testDB", async (req, res) => {
    try {
      const [sqlRes] = await db.execute(`SELECT * FROM contacts`);
      res.status(200).json(sqlRes);
    } catch (e) {
      res.status(500).json(e);
    }
  });

router.get("/protected", passport.authenticate("jwt"), (req, res) => {
    const msg =
      "If you can see this, you should be logged in, " + req.user.firstname;
    res.status(200).send(msg);
  });

router.get("/travaux", async (req, res) => {
  try {
    const [sqlRes] = await db.query(
      "SELECT * from travaux"
  );
  res.status(200).json(sqlRes);
  } catch (e) {
    res.status(500).send("Error retrieving data");
  }
});

router.post("/contact", async (req, res) => {
  try {
    const newContact = req.body;
    const [sqlRes] = await db.query(`INSERT INTO contacts SET ?`, [newContact]);
    res.status(200).json(sqlRes);
  } catch (e) {
    res.status(500).send("Erreur serveur");
  }
});

module.exports = router;