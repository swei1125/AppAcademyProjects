import {connect} from 'react-redux';
import {selectPokemonItem} from '../../reducers/selectors';
import ItemDetail from './item_detail';
import {withRouter} from 'react-router-dom';

const mapStateToProps = (state, ownProps) => ({
  item: selectPokemonItem(state, ownProps.match.params.itemId)
});

export default withRouter(connect(mapStateToProps)(ItemDetail));
