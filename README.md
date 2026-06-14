# Accelerate Guru — Warden Integration

Drop the `.warden` folder into your Magento project root, then run:

```bash
warden env up -d
```

That's it. Accelerate Guru is now serving your site with full-page cache, image optimisation, and bot protection.

---

**Configuration** — `.warden/config/magento_ultra.ini`

All options are documented inline. The defaults work out of the box for any Warden project.

If you use Varnish (`WARDEN_VARNISH=1` in your `.env`), change `upstream_addr` to `varnish`. Both `nginx` and `varnish` listen on port 80 — the port never changes.

```ini
; no Varnish (default):
upstream_addr = nginx

; with Varnish (WARDEN_VARNISH=1):
upstream_addr = varnish
```

---

**Stats dashboard** — `https://yoursite.test/stats-ag`

Shows cache hit rate, bandwidth saved, live config, and cache controls. Toggle changes are written back to `.warden/config/magento_ultra.ini` (and sibling INI files) and hot-reload without a container restart.

`/stats-ag` is only served on **licensed** hosts (e.g. `mage.yoursite.test` with `key = dev`). Unlicensed domains such as a masked `.com` without a production key are transparent pass-through — no cache, no rewrite, and `/stats-ag` is forwarded to Magento as usual.

To put a licensed `.com` behind AG, add it to the Traefik router **and** your license:

```yaml
accelerate-guru:
  labels:
    - "traefik.http.routers.${WARDEN_ENV_NAME}-ag.rule=Host(`mage.${TRAEFIK_DOMAIN}`) || Host(`example.com`)"
```

---

**CLI commands**

```bash
warden accelerate-guru restart   # apply config changes
warden accelerate-guru logs      # tail logs
warden accelerate-guru status    # container status
warden accelerate-guru pull      # update to latest image
```
