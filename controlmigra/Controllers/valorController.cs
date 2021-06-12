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
    public class valorController : ControllerBase
    {
        public bool addval([FromBody] valor ndoc)
        {
            return valorData.addvalor(ndoc);
        }

        public List<valor> listval()
        {
            return valorData.Listval();
        }
    }
}
