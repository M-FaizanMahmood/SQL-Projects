# AutoNews AI Platform

## Executive Architecture & Business Blueprint (Version 1.0)

> This document is the master blueprint for building a production-grade,
> event-driven AI news publishing platform focused on **minimal cost**,
> **maximum reliability**, and **future scalability**.

------------------------------------------------------------------------

# 1. Vision

Build a fully autonomous platform that continuously discovers news,
generates SEO-optimized articles using AI, and publishes them with
minimal human intervention.

## Primary Goals

1.  Autonomous operation (24/7)
2.  Low infrastructure cost
3.  Modular architecture
4.  Event-driven processing
5.  Easy to extend (new sources, AI providers, publishers)
6.  Enterprise-grade reliability
7.  SEO-first publishing
8.  Cloud-native deployment

------------------------------------------------------------------------

# 2. Success Metrics (KPIs)

  KPI                  Target
  -------------------- ---------------
  Uptime               99.9%
  Idle RAM             \<700 MB
  API Response         \<250 ms
  AI Calls             1 per article
  Duplicate Articles   \<1%
  Deployment Time      \<15 minutes

------------------------------------------------------------------------

# 3. Guiding Principles

-   Single Responsibility Principle
-   Clean Architecture
-   Event-Driven Workflow
-   Configuration over Hardcoding
-   Plugin-Based Sources
-   API First
-   Database as Source of Truth
-   Observability by Default

------------------------------------------------------------------------

# 4. Recommended Technology Stack

  ------------------------------------------------------------------------
  Layer                  Technology                         Why
  ---------------------- ---------------------------------- --------------
  Language               Python 3.12                        Mature
                                                            ecosystem

  Backend                FastAPI                            Async, fast,
                                                            OpenAPI

  ORM                    SQLAlchemy 2                       Robust,
                                                            scalable

  Validation             Pydantic v2                        Type-safe

  Database               PostgreSQL                         ACID, JSONB,
                                                            Full Text
                                                            Search

  Event Bus              Redis Streams                      Lightweight
                                                            and free

  Scheduler              APScheduler                        Time-based
                                                            jobs only

  HTTP                   httpx                              Async
                                                            connection
                                                            pooling

  Extraction             Trafilatura + BeautifulSoup        High-quality
                                                            article
                                                            extraction

  Frontend               Next.js 15                         SEO + ISR

  Styling                Tailwind CSS + shadcn/ui           Fast UI
                                                            development

  Reverse Proxy          Nginx                              Stable and
                                                            lightweight

  CDN / DNS              Cloudflare Free                    SSL, CDN,
                                                            caching

  CI/CD                  GitHub Actions                     Free
                                                            automation

  Containers             Docker Compose                     Easy
                                                            deployment
  ------------------------------------------------------------------------

------------------------------------------------------------------------

# 5. High-Level Architecture

``` text
News Sources
      │
      ▼
Source Discovery
      │
      ▼
PostgreSQL
      │
      ▼
Redis Streams
      │
 ┌────┼─────┐
 ▼    ▼     ▼
Extract AI  SEO
      │
      ▼
Publisher
      │
      ▼
FastAPI
      │
      ▼
Next.js
```

------------------------------------------------------------------------

# 6. Services

-   Discovery Service
-   Extraction Service
-   AI Generation Service
-   SEO Service
-   Publishing Service
-   API Service
-   Admin Service
-   Monitoring Service

Each service has one responsibility and communicates through events.

------------------------------------------------------------------------

# 7. Plugin Architecture

Every news source implements the same interface:

-   discover_urls()
-   fetch_article()
-   normalize()

Adding a new source only requires: 1. Create one plugin. 2. Add one
database record. 3. Enable it in the admin panel.

------------------------------------------------------------------------

# 8. Database Overview

Core tables:

-   sources
-   articles
-   article_contents
-   seo_metadata
-   jobs
-   events
-   users
-   settings
-   logs

------------------------------------------------------------------------

# 9. Event Pipeline

DISCOVERED → EXTRACTED → GENERATED → VALIDATED → READY → PUBLISHED

Workers subscribe to events instead of continuously polling.

------------------------------------------------------------------------

# 10. Deployment

Recommended:

-   Oracle Cloud Always Free VPS
-   Docker Compose
-   Nginx
-   PostgreSQL
-   Redis
-   FastAPI
-   Next.js
-   Cloudflare

------------------------------------------------------------------------

# 11. Cost Analysis

  Item               Cost
  ------------------ -----------------------------------
  Oracle Cloud VPS   Free
  Cloudflare         Free
  GitHub Actions     Free
  PostgreSQL         Free
  Redis              Free
  Docker             Free
  Domain             \~\$10/year
  AI API             Variable (largest operating cost)

Infrastructure cost can remain near **\$0/month** excluding AI usage and
domain.

------------------------------------------------------------------------

# 12. Development Phases

1.  Foundation
2.  Database
3.  Discovery
4.  Extraction
5.  AI Generation
6.  Publishing
7.  Frontend
8.  Admin Dashboard
9.  Monitoring
10. Production Deployment

------------------------------------------------------------------------

# 13. Future Extensions

-   Translation
-   Image generation
-   Social media publishing
-   Newsletter generation
-   Recommendation engine
-   Analytics dashboard
-   Multi-tenant support

------------------------------------------------------------------------

# Conclusion

The proposed architecture prioritizes maintainability, scalability, and
operational efficiency. It minimizes infrastructure costs while
providing a strong foundation for future growth. By combining a
plugin-based design, event-driven processing, and open-source
technologies, the platform can evolve from a single-site deployment to a
large-scale publishing ecosystem with minimal architectural changes.
