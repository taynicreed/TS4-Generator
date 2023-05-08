// client/src/App.js

import React from "react";
import "./App.css";
import {Outlet} from "react-router-dom";


const Layout = () => {
  return (
    <>
      <Outlet />
    </>
  );
};

export default Layout;
