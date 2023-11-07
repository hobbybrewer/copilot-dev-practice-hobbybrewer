import http from "../http-common";

class ListingDataService {
  getAll(pageSize=0,page="all") {
    console.log("page:"+page);
    console.log("pageSize:"+pageSize);
    //return http.get(`/model?page=1&size=10`);
    if(page === "all")
      return http.get(`/model?page=1&size=1000`);
      //return http.get("/model?page=all");
    else  
      return http.get(`/model?page=${page}&size=${pageSize}`);
    //return http.get("/model?page=all");
  }

  get(id) {
    return http.get(`/model/${id}`);
  }

  create(data) {
    return http.post("/model", data);
  }

  update(id, data) {
    return http.put(`/model/${id}`, data);
  }

  delete(id) {
    return http.delete(`/model/${id}`);
  }

  deleteAll() {
    return http.delete(`/model`);
  }

  findByTitle(title) {
    return http.get(`/model?title=${title}`);
  }
}

export default new ListingDataService();