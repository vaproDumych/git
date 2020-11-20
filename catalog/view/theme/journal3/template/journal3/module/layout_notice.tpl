<div class="notice-module <?php echo $j3->classes($classes); ?>" data-options='<?php echo json_encode($options, JSON_FORCE_OBJECT); ?>'>
  <div class="module-body">
    <div class="hn-body">
      <div class="hn-content"><?php echo $content; ?></div>
      <?php if ($closeButton): ?>
        <div class="layout-notice-close-button">
          <?php if ($closeLink['href']): ?>
            <a class="btn hn-close" href="<?php $closeLink['href']; ?>" <?php echo $j3->linkAttrs($closeLink); ?>>
              <?php if ($closeText): ?>
                <span class="btn-text"><?php echo $closeText; ?></span>
              <?php endif; ?>
            </a>
          <?php else: ?>
            <button class="btn hn-close">
              <?php if ($closeText): ?>
                <span class="btn-text"><?php echo $closeText; ?></span>
              <?php endif; ?>
            </button>
          <?php endif; ?>
        </div>
      <?php endif; ?>
    </div>
  </div>
</div>
