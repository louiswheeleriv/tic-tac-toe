import React from "react";
import { createRoot } from "react-dom/client";
import {
  ApolloClient,
  InMemoryCache,
  ApolloProvider,
  useQuery,
  gql
} from "@apollo/client";

const client = new ApolloClient({
  uri: "http://localhost:3000/graphql",
  cache: new InMemoryCache()
});

const listGamesQuery = gql`
	{
		games(
      sortBy: [{ field: CREATED_AT, direction: ASC }]
    ) {
      id
      status
      openPlayerSlots
      createdAt
      users {
        id
        email
      }
    }
	}
`;

function GamesTable() {
	const { loading, error, data } = useQuery(listGamesQuery);

	if (loading) return <p>Loading games...</p>;
	if (error) return <p>Error!</p>;

	var rows = data.games.map(function(game) {
		return gameRow(game);
	});
	return (
		<div className="table-wrapper">
			<table className="table">
				<thead>
					<tr>
						<th>Created</th>
						<th>Status</th>
						<th># Players</th>
					</tr>
				</thead>
				<tbody>
					{rows}
				</tbody>
			</table>
		</div>
	);
}

function gameRow(game) {
	return (
		<tr key={game.id}>
			<td>{game.createdAt}</td>
			{/* <td><a href={"unit/" + unitModel.unit.id}>{unitModel.unit.name}</a></td> */}
			<td>{game.status}</td>
			<td>{game.users.length}/2</td>
		</tr>
	)
}

function App() {
  return (
    <ApolloProvider client={client}>
			{/* <FilterDropdownRow /> */}
			<GamesTable />
    </ApolloProvider>
  );
}

const domNode = document.getElementById('root');
const root = createRoot(domNode);
root.render(<App />);
