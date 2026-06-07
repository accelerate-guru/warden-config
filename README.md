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

Shows cache hit rate, bandwidth saved, live config, and cache controls.

---

**CLI commands**

```bash
warden accelerate-guru restart   # apply config changes
warden accelerate-guru logs      # tail logs
warden accelerate-guru status    # container status
warden accelerate-guru pull      # update to latest image
```
