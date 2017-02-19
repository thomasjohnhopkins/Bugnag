import * as React from 'react';
import './App.css';
import { NagListItem } from './components/NagListItem';
import * as R from 'ramda';
import { Grid, Cell } from 'react-mdl';

const nags = [
  {
    id: 1,
    title: 'This is an amazing bug',
    body: `
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas interdum 
      lorem eget nisi consequat porttitor. Praesent feugiat risus turpis… 
    `,
  },
  {
    id: 2,
    title: 'This bug drives me crazy',
    body: `
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas interdum
      lorem eget nisi consequat porttitor. Praesent feugiat risus turpis… 
    `,
  },
  {
    id: 4,
    title: 'Call the cops! This one stole my dignity',
    body: `
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas interdum 
      lorem eget nisi consequat porttitor. Praesent feugiat risus turpis… 
    `,
  },
];

class App extends React.Component<null, null> {

  renderNags() {
    return R.map((nag) => {
      return (
        <Grid style={{width: '80%', margin: 'auto'}}>
          <Cell col={12}>
            <NagListItem
              key={nag.id}
              title={nag.title}
              body={nag.body}
            />
          </Cell>
        </Grid>
      );
    }, nags);
  }

  render() {
    return (
      <div className="App">
        {this.renderNags()}
      </div>
    );
  }
}

export default App;
