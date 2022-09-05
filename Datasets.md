---
layout: page
title: Jaouad ELBahraoui
subtitle: Datasets
---

<div>
  <div>
      <div>
        "Test txt"
      </div>
      <div>
      <a href="{{ site.url }}/Datasets/path.jpg" download="1rs Data Set"><img src="{{ site.url }}/Datasets/path.jpg" alt="thumbnail" width="120"></a>
      </div>
  </div>
  <div>
    "Test txt"
  </div>
</div>

{% if paginator.total_pages > 1 %}
<ul class="pager main-pager">

      {% if paginator.previous_page %}
            <li class="previous">
                 <a href="{{ paginator.previous_page_path | relative_url }}">&larr; Newer Posts</a>
            </li>
      {% endif %}

      {% if paginator.next_page %}
            <li class="next">
                 <a href="{{ paginator.next_page_path | relative_url }}">Older Posts &rarr;</a>
            </li>
      {% endif %}
</ul>
{% endif %}
