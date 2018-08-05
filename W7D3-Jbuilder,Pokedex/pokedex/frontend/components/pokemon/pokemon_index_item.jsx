import React from 'react';
import { Link } from 'react-router-dom';


const PokemonIndexItem = (({pokemon}) => (
  <li>
    <Link to={`/pokemon/${pokemon.id}`}>
      <img src={pokemon.imageUrl} style={{ height: 50, width: 50 }}/>
      {pokemon.name}
    </Link>
  </li>
));

export default PokemonIndexItem;
