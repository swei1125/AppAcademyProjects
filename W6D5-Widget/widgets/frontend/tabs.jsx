import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {currentTab: 0};
    this.setCurrentTab = this.setCurrentTab.bind(this);
  }

  setCurrentTab(e, id) {
    e.preventDefault();
    this.setState({currentTab: id});
  }

  render() {
    const { setCurrentTab } = this;

    return (
      <div className='tab-main'>
        <h1>Tabs</h1>
        <div className='tab-pane'>
          <ul className='tabs'>
            {this.props.tabs.map((tab, i) => <li
              className={i === this.state.currentTab ? 'active' : ""}
              onClick={(e) => setCurrentTab(e, i)}
              key={tab.id}>{tab.title}</li>)}
          </ul>
          <div className='content'>
            <article>{this.props.tabs[this.state.currentTab].content}</article>
          </div>
        </div>
      </div>
    );
  }
}

export default Tabs;
