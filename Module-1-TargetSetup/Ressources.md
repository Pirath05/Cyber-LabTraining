# Target Environment Setup: Metasploitable 2

## 01. Context and Sourcing
The deployment utilizes the `tleemcjr/metasploitable2` containerized version of the classic Rapid7 vulnerable VM. While the image has not been updated in ~8 years, it remains the primary reference for legacy service exploitation and signature-based detection testing.

**Resources:**
* **Docker Hub:** [tleemcjr/metasploitable2](https://hub.docker.com/r/tleemcjr/metasploitable2)
* **Upstream Source:** [Rapid7 Metasploitable 2](https://github.com/rapid7/metasploitable2)

## 02. Deployment Workflow
To maintain network hygiene, the instance is attached to a non-default bridge interface. This prevents accidental exposure to the physical LAN and ensures a deterministic IP for automated tooling.

### Execution String
```bash
# Initialize vulnerable instance with service bootstrap
docker run --name metasploitable \
  -it \
  --network pentest-net \
  --ip 172.20.0.2 \
  tleemcjr/metasploitable2:latest \
  sh -c "/bin/services.sh && bash"
