import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { time: new Date() };

  }

  tick() {
    this.setState({time: new Date()});
  }

  componentDidMount() {
    this.interval = setInterval(() => {
      this.tick();
    }, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
    this.interval = 0;
  }

  render() {
    return (
      <div className="main-clock">
        <h1>Clock</h1>
        <div className='clock'>

          <p>
            <span className='time'>Time:</span>
            <span>
              <span>{this.state.time.getHours()}</span>
              <span>:</span>
              <span>{this.state.time.getMinutes()}</span>
              <span>:</span>
              <span>{this.state.time.getSeconds()}</span>
              <span>{" "}PDT</span>
            </span>
          </p>
          <p>
            <span className="date">Date:</span>
            <span>{this.state.time.toDateString()}</span>
          </p>
        </div>
      </div>
    );
  }
}



export default Clock;
