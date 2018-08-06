import React from 'react';

class BenchIndex extends React.Component {

  render() {
    return(
      <div>
        <ul className='bench-list'>
          {this.props.benches.map(bench =>
            <div key={bench.id}>
              <p>{bench.description}</p>
              <li>Seating: {bench.seating}</li>
              <li>Latitude: {bench.lat}</li>
              <li>Longitude: {bench.lng}</li>
            </div>)}
        </ul>
      </div>
    );
  }
}

export default BenchIndex;
