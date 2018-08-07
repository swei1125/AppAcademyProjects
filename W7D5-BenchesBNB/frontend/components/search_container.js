import Search from './search';
import {connect} from 'react-redux';
import {updateFilter} from '../actions/bench_actions';


const mapStateToProps = state => ({
  benches: Object.values(state.entities.benches),
  maxSeating: state.ui.filters.maxSeating,
  minSeating: state.ui.filters.minSeating

});

const mapDispatchToProps = dispatch => ({
  updateFilter: (filter, value) => dispatch(updateFilter(filter, value))
});


export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
