import React from 'react';
import './App.css';
import Navbar from './Navbar';
import Home from './Home';
import Footer from './Footer';
import UserViewItems from './UserViewItems';
import UserRequestItem from './UserRequestItem';
import UserLogin from './UserLogin';
import AdminViewItems from './AdminViewItems';
import AdminLogin from './AdminLogin';
import { BrowserRouter as Router, Routes, Route} from 'react-router-dom';

function App() {
  return (
    <Router>
      <div className="App">
      <Navbar />
      <Routes>       
      <Route path="/home" exact element={<Home />} />
      <Route path="/user-view-items" element={<UserViewItems/>} />
      <Route path="/user-request-item" element={<UserRequestItem />} />
      <Route path="/user-login" element={<UserLogin />} />
      <Route path="/admin-view-items" element={<AdminViewItems />} />
      <Route path='/admin-login' element={<AdminLogin />} />
      </Routes>       
      <Footer />
    </div>
    </Router>
  );
}

export default App;
