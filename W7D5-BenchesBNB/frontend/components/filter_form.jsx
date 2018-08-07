import React from 'react';

class FilterForm extends React.Component {

  render() {
    return (
      <div>
        <form>
          <label>Max Seating:
            <input type='number'
              value={this.props.maxSeating}
              onChange={(e) => this.props.updateFilter('maxSeating', +e.target.value)} />
          </label>

          <label>Min Seating:
            <input type='number'
              value={this.props.minSeating}
              onChange={(e) => this.props.updateFilter('minSeating', +e.target.value)} />
          </label>
        </form>
      </div>
    );
  }
}

export default FilterForm;
