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
    public class paisController : ControllerBase
    {
        public bool addpais([FromBody] pais ndoc)
        {
            return paisData.addpais(ndoc);
        }
        public List<pais> listpais()
        {
            return paisData.listarPais();
        }
        public pais getpaisID(int id)
        {
            return paisData.ObtenerpaisID(id);
        }
        public bool edipais([FromBody] pais ndoc)
        {
            return paisData.editpais(ndoc);
        }
        public bool delpais(int id)
        {
            return paisData.delpais(id);
        }
    }
}
