import * as React from 'react';
import './NagListItem.css';
import {} from 'react-bootstrap';
// import * as MDL from 'react-mdl';
import { Card, CardTitle, CardText } from 'react-mdl';



type Props = {
  title: string;
  body: string;
}

type State = {

}

export class NagListItem extends React.Component<Props, State> {

  render() {
    return (
      <Card style={{width: '100%'}}>
        <CardTitle>
          {this.props.title}
        </CardTitle>
        <CardText>
          {this.props.body}
        </CardText>
      </Card>
    );
  }
}