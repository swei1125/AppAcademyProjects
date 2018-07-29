import React from 'react';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {names: props.names, inputVal: ""};
    this.setInput = this.setInput.bind(this);
  }

  setInput(e) {
    e.preventDefault();
    const val = e.currentTarget.value;
    const len = val.length;
    const names = this.props.names.filter(n => n.toLowerCase().slice(0, len) === val.toLowerCase());
    // const lis = document.querySelectorAll(".name");
    // let flyNames = Array.prototype.filter.call(lis, (li) => !names.includes(li.innerText));
    // Array.prototype.forEach.call(flyNames, (li) => {
    //     li.classList.remove("name");
    //     li.classList.add("fly");
    // });
    this.setState({names: names.length === 0 ? ["No matches"] : names, inputVal: val});
  }

  render() {

    const {setInput} = this;
    return (
      <div className='auto-main'>
        <h1>Autocomplete</h1>
        <div className='autocomplete'>
          <input onInput={setInput} placeholder='Search...'/>
          <ul className='names'>
            <ReactCSSTransitionGroup transitionName='auto' transitionEnterTimeout={500} transitionLeaveTimeout={500}>
              {this.state.names.map((n, i) => <li className='name' key={i}>{n}</li>)}
            </ReactCSSTransitionGroup>
          </ul>
        </div>
      </div>
    );
  }
}


export default Autocomplete;
