import { useState, useEffect } from "react";
import SignIn from './components/SignIn'
import {Routes, Route} from 'react-router-dom'

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