import React from 'react';



class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = { location: "", weather: "loading weather..." };
  }

  componentDidMount() {
    const xhr = new XMLHttpRequest();
    let that = this;
    navigator.geolocation.getCurrentPosition(function(position) {
      let lat = Math.floor(position.coords.latitude);
      let lon = Math.floor(position.coords.longitude);
      xhr.onreadystatechange = () => {
        if (xhr.readyState === 4 && xhr.status === 200) {
          let data = JSON.parse(xhr.response);

          const temp = `${(1.8*(data.main.temp - 273)+32).toFixed(2)} degrees`;
          that.setState({ location: data.name, weather: temp });
        }
      };
      xhr.open('GET', `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&APPID=6cbbdbfaef5ac161511a4b083e2b0d2d`, true);
      xhr.send();
    });


  }
  render() {

    return (
      <div className='main-weather'>
        <h1>Weather</h1>
        <div className='weather'>
          <p>{this.state.location}</p>
          <p>{this.state.weather}</p>
        </div>
      </div>
    );
  }
}

export default Weather;
