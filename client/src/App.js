import { useState, useEffect } from "react";
import SignIn from './components/SignIn'
import {Routes, Route} from 'react-router-dom'
import Navbar from './components/Navbar'

function App() {

  const [currentUser, setCurrentUser] = useState(false)

  function Login(user){
    setCurrentUser(user)
  }

  useEffect(() => {
    // auto-login
    fetch("/me").then((r) => {
      if (r.ok) {
        r.json().then((user) => setCurrentUser(user));
      }
    });
  }, []);


  return (
  <>
  <div style={{position: 'absolute', top: 0, height: '10px', width: '100vw', backgroundColor: 'black'}}></div>
    <Navbar/>
    <div style={{position: 'absolute',  height: '10px', width: '100vw', backgroundColor: 'black'}}></div>
      <Routes>
        <Route 
          path="/signin"
          element={<SignIn onLogin={Login}/>}
        />    
      </Routes>
  </>
  )
}

export default App;