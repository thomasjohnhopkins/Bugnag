import * as React from 'react';
import './App.css';
import { NagListItem } from './components/NagListItem';
import * as R from 'ramda';
import { Grid, Cell } from 'react-mdl';

import { nags } from './_data';

class App extends React.Component<null, null> {

  render() {
    return (
      <div className="App">
        <Grid className="App-grid">
          <Cell col={12}>
            {R.map((nag) => <NagListItem key={nag.id} nag={nag} />, nags)}
          </Cell>
        </Grid>
      </div>
    );
  }
}

export default App;
