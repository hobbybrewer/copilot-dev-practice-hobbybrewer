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

function createData(id, name, address, price, image) {
  return { id, name, address, price, image };
}

const columns = [
  { id: 'name', label: 'Name', minWidth: 170 },
  { id: 'address', label: 'Address', minWidth: 300 },
  { id: 'price', label: 'Price', minWidth: 300 },
  { id: 'image', label: 'Image', minWidth: 300 },

];

var listings;

var rows;

var pageSizes = [3, 10, 25, 100];
var pageSizeIndex = 3;

var firstTime = true;

//var rows;

export default function StickyHeadTable() {
  const [page, setPage] = React.useState(0);
  const [rowsPerPage, setRowsPerPage] = React.useState(pageSizes[pageSizeIndex]);
  const [isLoading, setLoading] = React.useState(true);
  const params= useParams()

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(+event.target.value);
    setPage(0);
  };


  const setActiveListing = (e) => {
    setLoading(true);
    console.log(e.target.textContent);
    console.log(e.target.rowindex);
    console.log(e.target.attributes.getNamedItem('rowindex').value);
    retrieveListingById(e.target.attributes.getNamedItem('rowindex').value);
    console.log(window.location.pathname);
    //window.history.replaceState(null, '', window.location.pathname+'/'+e.target.attributes.getNamedItem('rowindex').value);
    //window.location.href = window.location.href + '/listings/' + e.target.attributes.getNamedItem('rowindex').value;
  }


  function retrieveListingById(id) {
    ListingDataService.get(id)
      .then(response => {
        listings = response.data;
        console.log(response.data);
        setLoading(false);
        rows = [];
        rows.push(createData(listings.id, listings.name, listings.address.street, listings.price.$numberDecimal, listings.images.picture_url));
        console.log(rows);
      })
      .catch(e => {
        console.log(e);
      });
  }

  function retrieveListings() {
    ListingDataService.getAll()
      .then(response => {
        listings = response.data.listingsAndReviews;
        console.log(response);
        setLoading(false);
        rows = [];
        for (var i = 0; i < listings.length; i++) {
          rows.push(createData(listings[i].id, listings[i].name, listings[i].address.street, listings[i].price.$numberDecimal, listings[i].images.picture_url));
        };

        console.log(rows);

        //columns = columns1;
        //render();
      })
      .catch(e => {
        alert("Backend URL: NOT FOUND: 404: "+e.config.baseURL);
        console.log(e.config.baseURL);
        console.log(e);
      });
  }

  if(params.id !== undefined) {
    retrieveListingById(params.id);
  }
  else if (firstTime) {
    retrieveListings();
    firstTime = false;
  }

  if (isLoading) {
    return <div className="App">Loading...</div>;
  }

  return (
    <Paper sx={{ width: '100%', height: '100%', overflow: 'hidden' }}>
      <TableContainer sx={{ maxHeight: window.innerHeight - 200 }}>
        <Table stickyHeader aria-label="sticky table">
          <TableHead>
            <TableRow>
              {columns.map((column) => (
                <TableCell
                  key={column.id}
                  align={column.align}
                  style={{ minWidth: column.minWidth }}
                >
                  {column.label}
                </TableCell>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows
              .slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
              .map((row) => {
                return (
                  <TableRow onClick={setActiveListing} hover role="row" tabIndex={-1} key={row.id} >
                    {columns.map((column) => {
                      const value = row[column.id];
                      return (
                        <TableCell key={column.id} rowindex={row.id} align={column.align}>
                          {
                            column.id === 'image' ? <img src={value} width={300} alt="" /> : value
                          }
                        </TableCell>
                      );
                    })}
                  </TableRow>
                );
              })}
          </TableBody>
        </Table>
      </TableContainer>
      <TablePagination
        rowsPerPageOptions={pageSizes}
        component="div"
        count={rows.length}
        rowsPerPage={rowsPerPage}
        page={page}
        onPageChange={handleChangePage}
        onRowsPerPageChange={handleChangeRowsPerPage}
      />
    </Paper>
  );
}