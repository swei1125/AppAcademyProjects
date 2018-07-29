import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';
import Weather from './frontend/weather';
import Autocomplete from './frontend/autocomplete';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  ReactDOM.render(<Root />, root);
});

const tabs = [
  {id: 1, title: 'one', content: 'First tab'},
  {id: 2, title: 'two', content: 'Second tab'},
  {id: 3, title: 'three', content: 'Third tab'}
];

const names = ["Amon", "Joseph", "Kasey", "Vivian", "Yunan", "Elmer", "Eden", "Baba"];

const Root = () => (
  <div className='widget'>
    <Clock />
    <Weather />
    <div className='main-tabs-auto'>
      <Tabs tabs={tabs}/>
      <Autocomplete names={names}/>
    </div>
  </div>
);
