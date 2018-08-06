import React from 'react';

class BenchForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      description: "",
      seating: "",
      lat: props.lat,
      lng: props.lng
    };
    this.submit = this.submit.bind(this);
  }

  update(type) {
    return (e) => this.setState({[type]: e.target.value});
  }

  submit(e) {
    e.preventDefault();
    this.props.createBench(this.state)
    .then(this.props.history.push('/'));
  }

  render() {
    return (
      <div>
        <form>
          <label>Description:
            <input type='text' value={this.state.description} onChange={this.update('description')}/>
          </label>

          <label>Seating:
            <input type='number' value={this.state.seating} onChange={this.update('seating')}/>
          </label>

          <button type='submit' onClick={this.submit}>Submit</button>
        </form>
      </div>
    );
  }
}

export default BenchForm;
