import React, { Component } from "react";
import { Routes, Route, Link } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import "./App.css";

import Listing from "./components/listing.component";

class App extends Component {
  render() {
    return (
      <div>
        <nav className="navbar navbar-expand navbar-dark bg-dark">
          <a href="/listings" className="navbar-brand">
          Accommodations
          </a>          
        </nav>

        <div className="container mt-3">
          <Routes>
            <Route path="/" element={<Listing/>} />
            <Route path="/listings" element={<Listing/>} />
            <Route path="/listings/:id" element={<Listing/>} />
          </Routes>
        </div>
      </div>
    );
  }
}

export default App;