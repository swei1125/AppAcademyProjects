import React from 'react';
import {Link} from 'react-router-dom';

class SessionForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  update(type) {
    return (e) => this.setState({[type]: e.target.value});
  }

  render() {
    if (this.props.formType === 'signup') {
      return (
        <div>
          <h1>Sign Up</h1>
          {this.props.errors.map((err, i) => <span key={i}>{err}</span>)}
          <form>
            <label>Username:
              <input
                type='text'
                value={this.state.username}
                onChange={this.update('username')}
                />
            </label>
            <label>Password:
              <input
                type='password'
                value={this.state.password}
                onChange={this.update('password')}
                />
            </label>
            <button onClick={this.handleSubmit}>Sign Up</button>
            <Link to='/login'>Log In</Link>
          </form>
        </div>
      );
    }else {
      return (
        <div>
          <h1>Log In</h1>
          {this.props.errors.map((err, i) => <li key={i}>{err}</li>)}
          <form>
            <label>Username:
              <input
                type='text'
                value={this.state.username}
                onChange={this.update('username')}
                />
            </label>
            <label>Password:
              <input
                type='password'
                value={this.state.password}
                onChange={this.update('password')}
                />
            </label>
            <button onClick={this.handleSubmit}>Log In</button>
            <Link to='/signup'>Sign Up</Link>
          </form>
        </div>
      );
    }
  }
}

export default SessionForm;
