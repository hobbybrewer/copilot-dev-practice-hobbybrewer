# Listing Component Documentation

This document provides a detailed breakdown of the `listing.component.js` code. It is a React Component that fetches and displays data from a listing service using a table. The table can be paginated and each row of the table can be clicked to fetch specific details of a listing.

## File Structure
```Javascript
listing.component.js
```

## Dependencies
The following dependencies are used in this code:

```Javascript
import * as React from 'react';
import Paper from '@mui/material/Paper';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TablePagination from '@mui/material/TablePagination';
import TableRow from '@mui/material/TableRow';
import ListingDataService from "../services/listing.service";
import { useParams } from 'react-router';
```

## Functions

### createData(id, name, address, price, image)
This function is used to create a row of data to be displayed in the table.

```Javascript
function createData(id, name, address, price, image) { 
  return { id, name, address, price, image };
}
```

### StickyHeadTable()
This is the main function of the component. It includes state management, API calls to the listing service, and the JSX return statement.

```Javascript
export default function StickyHeadTable() { ... }
```

### retrieveListingById(id)
This function retrieves a specific listing from the ListingDataService by its id.

```Javascript
function retrieveListingById(id) { ... }
```

### retrieveListings()
This function retrieves all listings from the ListingDataService.

```Javascript
function retrieveListings() { ... }
```

## Hooks and Variables

- **page** - This state is used for the current page index of the pagination.
- **rowsPerPage** - This state determines the number of rows per page in the table.
- **isLoading** - This state is used to handle loading states.
- **params** - This hook from 'react-router' gets the dynamic parts of the URL.
- **listings** - This variable stores the response data from ListingDataService.
- **rows** - This variable stores the rows of data to be displayed in the table.
- **firstTime** - This variable is used to retrieve listings only the first time the component renders.

```Javascript
var listings;
var rows;
var firstTime = true;
const [page, setPage] = React.useState(0);
const [rowsPerPage, setRowsPerPage] = React.useState(pageSizes[pageSizeIndex]);
const [isLoading, setLoading] = React.useState(true);
const params= useParams()
```

## Pagination

The component uses `<TablePagination />` from '@mui/material/TablePagination' for adding pagination to the table.

```Javascript
<TablePagination
  rowsPerPageOptions={pageSizes}
  component="div"
  count={rows.length}
  rowsPerPage={rowsPerPage}
  page={page}
  onPageChange={handleChangePage}
  onRowsPerPageChange={handleChangeRowsPerPage}
/>
```

## Event Handlers
- **handleChangePage(event, newPage)** - This function changes the current page of the table when a different page number is clicked.
- **handleChangeRowsPerPage(event)** - This function changes the number of rows per page when a different option is selected from the dropdown.
- **setActiveListing(e)** - This function gets the row index when a row is clicked and retrieves the listing details by its id.

```Javascript
const handleChangePage = (event, newPage) => { ... };
const handleChangeRowsPerPage = (event) => { ... };
const setActiveListing = (e) => { ... };
```

## Rendering

The table is rendered using Material UI components. The `<TableCell />` component handles the display of images and other types of data. The rows are sliced according to the current page and rowsPerPage state. When a row is clicked, the `setActiveListing` function is triggered.

```Javascript
return (
  <Paper sx={{ width: '100%', height: '100%', overflow: 'hidden' }}>
    <TableContainer sx={{ maxHeight: window.innerHeight - 200 }}>
      <Table stickyHeader aria-label="sticky table"> ... </Table>
    </TableContainer>
    <TablePagination ... />
  </Paper>
);
```