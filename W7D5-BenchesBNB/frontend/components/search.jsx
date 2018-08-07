import React from 'react';
import BenchMap from './bench_map';
import BenchIndex from './bench_index';
import FilterForm from './filter_form';

const Search = ({benches, minSeating, maxSeating, updateFilter}) => (
      <div>
        <BenchMap
          benches={benches}
          updateFilter={updateFilter}/>
        <FilterForm updateFilter={updateFilter} minSeating={minSeating} maxSeating={maxSeating} />
        <BenchIndex benches={benches} />

      </div>
);


export default Search;
