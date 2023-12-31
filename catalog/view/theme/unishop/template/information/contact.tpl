<?php echo $header; ?>
<div class="container" itemscope="" itemtype="http://schema.org/LocalBusiness">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
		<h1 class="heading"><span><?php echo $heading_title; ?></span></h1>
		<?php if ($image) { ?>
			<div class="row">
				<div class="col-sm-12">
					<img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" class="img-responsive" />
				</div>
			</div>
			<hr />
		<?php } ?>
		<div style="display:none" itemprop="name"><?php echo $store; ?></div>
		<div class="row">
			<div class="col-sm-4">
				<h4 class="heading"><span><?php echo $store; ?></span></h4>
				<address itemprop="address" itemscope="" itemtype="http://schema.org/PostalAddress">
					<strong><?php echo $text_address; ?></strong><br />
					<span itemprop="streetAddress">
                    <?php  if (isset($GLOBALS['geo'])) {?>
                    г. <?php echo $GLOBALS['geo']->city; ?>,
                    <?php } else{ ?>
                        г. Новосибирск,
                    <?php }  ?>
                        ул. Центральная 7
          </span>
				</address>
				<?php if ($geocode) { ?>
					<a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
				<?php } ?>
				<?php if ($open) { ?>
					<hr />
					<strong><?php echo $text_open; ?></strong><br />
					<span itemprop="openingHours"><?php echo $open; ?></span><br />
					<br />
				<?php } ?>
			</div>
			<div class="contacts col-sm-4">
				<h4 class="heading"><span><?php echo $lang['text_contacts']; ?></span></h4>
				<div><i class="fa fa-phone" aria-hidden="true"></i><span itemprop="telephone"><?php echo $telephone; ?></span></div>
				<?php foreach ($phones as $phone) { ?>
					<div><i class="<?php echo $phone['icon']; ?>" aria-hidden="true"></i><?php echo $phone['number']; ?></div>
				<?php } ?>
				<?php if ($fax) { ?>
					<div><i class="fa fa-fax" aria-hidden="true"></i><span itemprop="faxNumber"><?php echo $fax; ?></span></div>
				<?php } ?>
				<?php if ($shop_email) { ?>
					<div><i class="fa fa-envelope-o" aria-hidden="true"></i><span itemprop="email"><?php echo $shop_email; ?></span></div>
				<?php } ?>
				<hr class="visible-xs" />
			</div>
			<?php if ($comment) { ?>
				<div class="col-sm-4">
				<h4 class="heading"><span><?php echo $text_comment; ?></span></h4>
					<?php echo $comment; ?>
				</div>
			<?php } ?>
		</div>
		<!--hr /><script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A387ba8717cbc88bc23aabb9d59f1a61bec963a0510c245d438fcf02ea726e8f8&amp;width=100%25&amp;height=300&amp;lang=ru_RU&amp;scroll=true"></script-->
		<?php if($text_in_contacts) { ?>
			<div class="row">
				<div class="col-sm-12">
					<?php echo $text_in_contacts; ?>
				</div>
			</div>
		<?php } ?>
		<hr />
      <?php if ($locations) { ?>
      <h3><?php echo $text_store; ?></h3>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                  <address>
                  <?php echo $location['address']; ?>
                  </address>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $location['telephone']; ?><br />
                  <br />
                  <?php if ($location['fax']) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <?php if ($location['open']) { ?>
                  <strong><?php echo $text_open; ?></strong><br />
                  <?php echo $location['open']; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($location['comment']) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
	<?php if($contact_map and 1==2) { ?>
		<div class="row">
			<div class="col-xs-12">
				<h4 class="heading"><span><?php echo $lang['text_location']; ?></span></h4>
				<?php echo $contact_map; ?>
				<hr />
			</div>
		</div>
	<?php } ?>
      <form onsubmit="yaCounter21736123.reachGoal('kontact'); ga('send', 'event', 'kontact', 'kontact'); return true;" type="submit" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
	  <!--<form onsubmit="yaCounter21736123.reachGoal('kontact'); return true;" type="submit" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">-->
        <fieldset>
          <h4 class="heading"><span><?php echo $text_contact; ?></span></h4>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
            <div class="col-sm-10">
              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php echo $captcha; ?>
          <p>Отправляя форму Вы соглашаетесь с <a href="/privacy">политикой конфиденциальности</a></p>
        </fieldset>
        <div class="buttons">
          <div class="pull-right">
            <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
