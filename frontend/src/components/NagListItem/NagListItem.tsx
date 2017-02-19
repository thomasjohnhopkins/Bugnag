import * as React from 'react';
import './NagListItem.css';
import { map } from 'ramda';
// import * as MDL from 'react-mdl';
import { Card, CardTitle, CardText } from 'react-mdl';

const bugGraphicURL = require('./bug-vectors/bee.svg');

type Nag = {
  title: string;
  body: string;
  createdAt: number;
  fixed: boolean;
  author: string;
  tags: string[];
  votes: number;
}

type Props = {
  nag: Nag;
}

type State = {

}

export class NagListItem extends React.Component<Props, State> {

  render() {
    const { nag } = this.props;

    return (
      <Card className={'NagListItem ' + ((nag.fixed) ? 'fixed': '')}>
        <div className="NagListItem-left">
          <div className="NagListItem-class-image">
            <img src={bugGraphicURL} />
          </div>
        </div>
        <div className="NagListItem-right">
          <CardTitle>
            {nag.title}
          </CardTitle>
          <CardText>
            <div className="NagListItem-subtitle">
              by <span className="NagListItem-author">
                {nag.author}
              </span>
            </div>
            <div className="NagListItem-body">
              {nag.body}
            </div>
            <div className="NagListItem-tags">
              {map((tag) => (<span key={tag}>{tag}</span>), nag.tags)}
            </div>
          </CardText>
        </div>
      </Card>
    );
  }
}