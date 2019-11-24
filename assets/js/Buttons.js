import React, { useState, useEffect } from 'react';

const BUTTONS_URI = '/api/buttons';

const Button = ({ label }) => {
  const [count, setCount] = useState(0);
  const handleClick = () => { setCount(count + 1) };

  return <button onClick={handleClick}>{label} {count}</button>;
};
const Buttons = () => {
  const [loaded, setLoaded] = useState(false);
  const [buttons, setButtons] = useState([]);

  useEffect(() => {
    fetch(BUTTONS_URI)
      .then(response => response.json())
      .then(json => {
        setButtons(json);
        setLoaded(true);
      });
  }, []);

  if (!loaded) {
    return <div>LOADING</div>;
  }
  return <div style={ {width: "800px", margin: "0 auto"} }>
    {buttons.map(button => (
      <div key={button.id} style={ {margin: "20px auto"} }>
        <Button label={button.label} />
      </div>
    ))}
  </div>
};

export default Buttons;
