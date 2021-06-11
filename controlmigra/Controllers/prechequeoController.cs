using controlmigra.Data;
using controlmigra.Modelo;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Controllers
{
    [ApiController]
    [Route("api/[action]/{id?}")]
    public class prechequeoController : ControllerBase
    {
        public bool addprechec([FromBody] prechequeo ndoc)
        {
            return prechequeoData.addprechec(ndoc);
        }
        public List<prechequeo> listpreche()
        {
            return prechequeoData.Listprechequeo();
        }
        public prechequeo getprecID(int id)
        {
            return prechequeoData.obtenerpreID(id);
        }
        public bool editprec([FromBody] prechequeo ndoc)
        {
            return prechequeoData.editprec(ndoc);
        }
        public bool delprec(int id)
        {
            return prechequeoData.delprec(id);
        }
    }
}
