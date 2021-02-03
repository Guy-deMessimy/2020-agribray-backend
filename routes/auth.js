const express = require("express");
const passport = require("passport");
const router = express.Router();
const { db, jwt_rounds, jwt_secret } = require("../config");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
require("../passeport-strategies");

router.post("/signup", async (req, res) => {
    try {
      const formData = req.body;
      formData.password = bcrypt.hashSync(formData.password, jwt_rounds);
      const [sqlRes] = await db.query(`INSERT INTO admin SET ?`, formData);
      delete formData.password;
      formData.id = sqlRes.insertId;
      const token = jwt.sign(formData, jwt_secret);
      res.status(201).json({ user: formData, token });
    } catch (e) {
      console.log(e);
      res.status(500).json(e);
    }
  });

  router.post("/login", passport.authenticate("local"), (req, res) => {
    const token = jwt.sign(req.user, jwt_secret);
    res.status(200).json({ user: req.user, token });
  });
  
  router.post("/travaux", passport.authenticate("jwt"), async (req, res) => {
    try {
      const { nature, image1, image2, image3, image4 } = req.body;
      const [sqlRes] = await db.query(
        "INSERT INTO travaux(nature, image1, image2, image3, image4) VALUES(?, ?, ?, ?, ?)",
        [nature, image1, image2, image3, image4
        ]);
      res.status(200).send("Successfully saved");
    } catch (e) {
      res.status(500).send("Error saving travaux");
    }
    });

  module.exports = router;
