<?php $context = get_defined_vars(); ?>
<?php if (!function_exists('renderTestimonialsItem')):
  function renderTestimonialsItem($item, $context) {
    ?>
    <div class="block-body">
      <?php if ($item['header'] == 'image'): ?>
        <div class="block-header"><img src="<?php echo $item['image']; ?>" alt="" class="block-image" width="<?php echo $context['imageDimensions']['width']; ?>" height="<?php echo $context['imageDimensions']['height']; ?>"/></div>
      <?php elseif ($item['header'] == 'icon'): ?>
        <div class="block-header"><i class="icon icon-block"></i></div>
      <?php endif; ?>
      <div class="block-content block-<?php echo $item['contentType']; ?>"><?php echo $item['content']; ?></div>
      <?php if ($item['footerText']): ?>
        <div class="block-footer"><?php echo $item['footerText']; ?></div>
      <?php endif; ?>
      <?php if ($item['expandButton']): ?>
        <div class="block-expand-overlay"><a class="block-expand btn"></a></div>
      <?php endif; ?>
    </div>
    <?php
  }
endif; ?>
<div class="<?php echo $j3->classes($classes); ?>">
  <?php if ($title): ?>
    <h3 class="title module-title"><?php echo $title; ?></h3>
  <?php endif; ?>
  <div class="module-body">
    <?php /* grid */ ?>
    <?php if ($display == 'grid' && !$carousel): ?>
      <?php foreach ($items as $item): ?>
        <div class="<?php echo $j3->classes($item['classes']); ?>">
          <?php renderTestimonialsItem($item, $context); ?>
        </div>
      <?php endforeach; ?>
    <?php endif; ?>
    <?php /* grid + carousel */ ?>
    <?php if ($display == 'grid' && $carousel): ?>
      <div class="swiper" data-items-per-row='<?php echo json_encode($itemsPerRow, JSON_FORCE_OBJECT); ?>' data-options='<?php echo json_encode($carouselOptions, JSON_FORCE_OBJECT); ?>'>
        <div class="swiper-container" <?php if ($j3->isRTL()): ?>dir="rtl"<?php endif; ?>>
          <div class="swiper-wrapper">
            <?php foreach ($items as $item): ?>
              <div class="<?php echo $j3->classes($item['classes']); ?>">
                <?php renderTestimonialsItem($item, $context); ?>
              </div>
            <?php endforeach; ?>
          </div>
        </div>
        <div class="swiper-buttons">
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
        </div>
        <div class="swiper-pagination"></div>
      </div>
    <?php endif; ?>
    <?php /* tabs */ ?>
    <?php if ($display == 'tabs'): ?>
      <div class="tabs-container">
        <ul class="nav nav-tabs">
          <?php $index = 1;
          foreach ($items as $item): ?>
            <li class="<?php echo $j3->classes($item['tab_classes']); ?>">
              <?php if (\Journal3\Utils\Arr::get($item, 'link.href')): ?>
                <a href="<?php echo $item['link']['href'];
                $index++; ?>"><?php echo $item['title']; ?></a>
              <?php else: ?>
                <a href="#<?php echo $id; ?>-tab-<?php echo $index++; ?>" data-toggle="tab"><?php echo $item['title']; ?></a>
              <?php endif; ?>
            </li>
          <?php endforeach; ?>
        </ul>
        <div class="tab-content">
          <?php $index = 1;
          foreach ($items as $item): ?>
            <div class="<?php echo $j3->classes($item['classes']); ?>" id="<?php echo $id; ?>-tab-<?php echo $index++; ?>">
              <?php renderTestimonialsItem($item, $context); ?>
            </div>
          <?php endforeach; ?>
        </div>
      </div>
    <?php endif; ?>
    <?php /* accordion */ ?>
    <?php if ($display == 'accordion'): ?>
      <div class="panel-group" id="<?php echo $id; ?>-collapse">
        <?php $index = 0;
        foreach ($items as $item): $index++; ?>
          <div class="<?php echo $j3->classes($item['classes']); ?>">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a href="#<?php echo $id; ?>-collapse-<?php echo $index; ?>" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#<?php echo $id; ?>-collapse" aria-expanded="false">
                  <?php echo $item['title']; ?>
                  <i class="fa fa-caret-down"></i>
                </a>
              </h4>
            </div>
            <div class="<?php echo $j3->classes($item['panel_classes']); ?>" id="<?php echo $id; ?>-collapse-<?php echo $index; ?>">
              <div class="panel-body">
                <?php renderTestimonialsItem($item, $context); ?>
              </div>
            </div>
          </div>
        <?php endforeach; ?>
      </div>
    <?php endif; ?>
  </div>
</div>
