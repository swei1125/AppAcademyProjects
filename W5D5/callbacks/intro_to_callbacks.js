class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.  
    let date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    this.printTime();
    this._tick();
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    if (this.seconds > 59) {
      this.seconds -= 60;
      this.minutes += 1;
      if (this.minutes > 59) {
        this.minutes -= 60;
        this.hours += 1;
        if (this.hours > 23) {
          this.hours -= 24;
        }
      }
    }
  
    let currentTime = `${this.hours}:${this.minutes}:${this.seconds}`;
    console.log( "The current time is:" + currentTime);
    
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    return setInterval(() => {
      this.seconds += 1;
      this.printTime(this.hours, this.minutes, this.seconds);
    }, 1000);
  }
}

const clock = new Clock();