import React from 'react';

class BenchIndex extends React.Component {
  
  render() {
    return(
      <div>
        <ul className='bench-list'>
          {this.props.benches.map(bench =>
            <div key={bench.id}>
              <p>{bench.description}</p>
              <li>{bench.lat}</li>
              <li>{bench.lng}</li>
            </div>)}
        </ul>
      </div>
    );
  }
}

export default BenchIndex;
