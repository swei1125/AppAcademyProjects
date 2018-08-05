import React from 'react';

class ItemDetail extends React.Component {
  constructor(props) {
    super(props);
  }



  render() {
    if(!this.props.item) return null;
    return(
      <section className='item-detail'>
        <h3>{this.props.item.name}</h3>
        <ul>
          <li>Happiness: {this.props.item.happiness}</li>
          <li>Price: {this.props.item.price}</li>
        </ul>
      </section>
    );
  }
}


export default ItemDetail;
